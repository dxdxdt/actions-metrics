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
Updated: 2026-11-25T20:54:19.661107+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.758 |  |
| ap-east-1 | 0.486 |  |
| ap-east-2 | 0.440 |  |
| ap-northeast-1 | 0.350 |  |
| ap-northeast-2 | 0.426 |  |
| ap-northeast-3 | 0.368 |  |
| ap-south-1 | 0.690 |  |
| ap-south-2 | 0.693 |  |
| ap-southeast-1 | 0.541 |  |
| ap-southeast-2 | 0.485 |  |
| ap-southeast-3 | 0.585 |  |
| ap-southeast-4 | 0.541 |  |
| ap-southeast-5 | 0.555 |  |
| ap-southeast-6 | 0.502 |  |
| ap-southeast-7 | 0.619 |  |
| ca-central-1 | 0.194 | 18 |
| ca-west-1 | 0.158 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.424 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.421 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.526 |  |
| me-central-1 | 0.685 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.727 |  |
| mx-central-1 | 0.174 |  |
| sa-east-1 | 0.508 |  |
| sa-west-1 | 0.567 |  |
| us-east-1 | 0.163 | 5195 |
| us-east-2 | 0.148 | 1730 |
| us-gov-east-1 | 0.168 | 1967 |
| us-gov-west-1 | 0.104 | 250 |
| us-west-1 | 0.099 | 4226 |
| us-west-2 | 0.104 | 200 |

