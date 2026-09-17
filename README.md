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
Updated: 2026-09-17T23:28:30.500774+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.610 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.643 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.767 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.218 | 18 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.687 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.642 |  |
| us-east-1 | 0.183 | 5103 |
| us-east-2 | 0.194 | 1686 |
| us-gov-east-1 | 0.164 | 1915 |
| us-gov-west-1 | 0.171 | 234 |
| us-west-1 | 0.108 | 4123 |
| us-west-2 | 0.167 | 192 |

