# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-07-02T23:57:52.362354+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.193 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.164 | 4812 |
| us-east-2 | 0.134 | 1650 |
| us-gov-east-1 | 0.139 | 1728 |
| us-gov-west-1 | 0.192 | 200 |
| us-west-1 | 0.133 | 3731 |
| us-west-2 | 0.192 | 164 |

