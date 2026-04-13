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
Updated: 2026-04-13T11:11:37.756880+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.884 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.731 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.235 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.533 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.447 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.180 | 4492 |
| us-east-2 | 0.171 | 1498 |
| us-gov-east-1 | 0.172 | 1646 |
| us-gov-west-1 | 0.188 | 192 |
| us-west-1 | 0.140 | 3406 |
| us-west-2 | 0.186 | 155 |

