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
Updated: 2026-09-21T00:42:47.821604+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.698 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.743 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.131 | 18 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.433 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.093 | 5111 |
| us-east-2 | 0.107 | 1686 |
| us-gov-east-1 | 0.108 | 1921 |
| us-gov-west-1 | 0.262 | 234 |
| us-west-1 | 0.210 | 4130 |
| us-west-2 | 0.271 | 192 |

