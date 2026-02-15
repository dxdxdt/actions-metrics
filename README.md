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
Updated: 2026-02-15T13:40:24.329985+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.679 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.972 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.781 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.555 |  |
| us-east-1 | 0.091 | 4124 |
| us-east-2 | 0.066 | 1343 |
| us-gov-east-1 | 0.067 | 1473 |
| us-gov-west-1 | 0.227 | 148 |
| us-west-1 | 0.245 | 3062 |
| us-west-2 | 0.234 | 125 |

