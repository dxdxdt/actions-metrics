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
Updated: 2026-08-19T21:18:28.246155+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.576 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.624 |  |
| ap-southeast-3 | 0.779 |  |
| ap-southeast-4 | 0.668 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.828 |  |
| ca-central-1 | 0.271 | 18 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.553 |  |
| eu-central-2 | 0.576 |  |
| eu-north-1 | 0.605 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.668 |  |
| us-east-1 | 0.229 | 5024 |
| us-east-2 | 0.230 | 1680 |
| us-gov-east-1 | 0.214 | 1856 |
| us-gov-west-1 | 0.151 | 224 |
| us-west-1 | 0.100 | 3998 |
| us-west-2 | 0.136 | 183 |

