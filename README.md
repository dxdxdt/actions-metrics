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
Updated: 2026-03-06T10:28:04.411064+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.511 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.257 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.494 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.884 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.202 | 4229 |
| us-east-2 | 0.199 | 1402 |
| us-gov-east-1 | 0.198 | 1532 |
| us-gov-west-1 | 0.182 | 173 |
| us-west-1 | 0.113 | 3183 |
| us-west-2 | 0.175 | 141 |

