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
Updated: 2026-05-21T06:45:34.396199+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.987 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.558 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.235 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.481 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.171 | 4671 |
| us-east-2 | 0.174 | 1603 |
| us-gov-east-1 | 0.174 | 1699 |
| us-gov-west-1 | 0.198 | 195 |
| us-west-1 | 0.141 | 3583 |
| us-west-2 | 0.199 | 158 |

