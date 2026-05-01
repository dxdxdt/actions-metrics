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
Updated: 2026-05-01T16:47:47.109340+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.876 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.856 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.165 | 4580 |
| us-east-2 | 0.173 | 1553 |
| us-gov-east-1 | 0.147 | 1669 |
| us-gov-west-1 | 0.203 | 194 |
| us-west-1 | 0.140 | 3512 |
| us-west-2 | 0.211 | 157 |

