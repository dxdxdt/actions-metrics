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
Updated: 2026-08-18T20:14:38.621245+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.959 |  |
| ap-south-2 | 0.987 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.694 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.221 | 18 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.486 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.188 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.184 | 5019 |
| us-east-2 | 0.181 | 1680 |
| us-gov-east-1 | 0.164 | 1845 |
| us-gov-west-1 | 0.210 | 224 |
| us-west-1 | 0.127 | 3991 |
| us-west-2 | 0.210 | 182 |

