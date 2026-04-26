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
Updated: 2026-04-26T22:30:35.407212+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.860 |  |
| ap-southeast-2 | 0.793 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.312 |  |
| eu-west-2 | 0.356 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.777 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.068 | 4570 |
| us-east-2 | 0.093 | 1536 |
| us-gov-east-1 | 0.098 | 1665 |
| us-gov-west-1 | 0.316 | 194 |
| us-west-1 | 0.253 | 3487 |
| us-west-2 | 0.302 | 157 |

