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
Updated: 2026-04-03T15:34:42.119069+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.686 |  |
| ap-east-2 | 0.628 |  |
| ap-northeast-1 | 0.507 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.213 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.583 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.724 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.164 | 4424 |
| us-east-2 | 0.152 | 1477 |
| us-gov-east-1 | 0.157 | 1623 |
| us-gov-west-1 | 0.188 | 191 |
| us-west-1 | 0.130 | 3346 |
| us-west-2 | 0.186 | 153 |

