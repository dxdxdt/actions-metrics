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
Updated: 2026-08-20T23:18:38.863149+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.658 |  |
| ap-east-2 | 0.591 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.278 | 18 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.537 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.571 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.942 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.204 | 5032 |
| us-east-2 | 0.237 | 1680 |
| us-gov-east-1 | 0.224 | 1863 |
| us-gov-west-1 | 0.172 | 224 |
| us-west-1 | 0.108 | 4006 |
| us-west-2 | 0.174 | 184 |

