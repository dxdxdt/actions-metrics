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
Updated: 2026-03-28T22:22:54.220739+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.723 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.963 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.408 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.738 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.076 | 4384 |
| us-east-2 | 0.112 | 1461 |
| us-gov-east-1 | 0.106 | 1611 |
| us-gov-west-1 | 0.296 | 190 |
| us-west-1 | 0.242 | 3316 |
| us-west-2 | 0.291 | 152 |

