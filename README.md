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
Updated: 2026-02-22T06:38:25.377753+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.670 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.652 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.804 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.598 |  |
| us-east-1 | 0.116 | 4159 |
| us-east-2 | 0.076 | 1369 |
| us-gov-east-1 | 0.079 | 1499 |
| us-gov-west-1 | 0.210 | 160 |
| us-west-1 | 0.232 | 3095 |
| us-west-2 | 0.209 | 129 |

