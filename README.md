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
Updated: 2026-03-16T22:26:00.458837+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.779 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.821 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.467 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.754 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.078 | 4293 |
| us-east-2 | 0.108 | 1429 |
| us-gov-east-1 | 0.112 | 1578 |
| us-gov-west-1 | 0.277 | 186 |
| us-west-1 | 0.244 | 3244 |
| us-west-2 | 0.299 | 148 |

