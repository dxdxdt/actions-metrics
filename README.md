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
Updated: 2026-09-12T02:23:08.533566+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.992 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.718 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.192 | 18 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.549 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.614 |  |
| us-east-1 | 0.164 | 5094 |
| us-east-2 | 0.161 | 1685 |
| us-gov-east-1 | 0.141 | 1910 |
| us-gov-west-1 | 0.189 | 233 |
| us-west-1 | 0.130 | 4102 |
| us-west-2 | 0.186 | 192 |

