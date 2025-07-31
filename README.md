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
Updated: 2025-07-31T20:15:32.782280+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.782 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.697 |  |
| ap-south-1 | 0.887 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.743 |  |
| ca-central-1 | 0.123 | 11 |
| eu-central-1 | 0.445 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.473 |  |
| eu-west-1 | 0.362 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.414 |  |
| me-south-1 | 0.825 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.097 | 2603 |
| us-east-2 | 0.096 | 665 |
| us-gov-east-1 | 0.093 | 838 |
| us-gov-west-1 | 0.240 | 2 |
| us-west-1 | 0.243 | 1770 |
| us-west-2 | 0.246 |  |

