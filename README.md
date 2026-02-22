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
Updated: 2026-02-22T09:24:05.025093+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.882 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.861 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.168 | 4161 |
| us-east-2 | 0.169 | 1369 |
| us-gov-east-1 | 0.166 | 1499 |
| us-gov-west-1 | 0.193 | 160 |
| us-west-1 | 0.146 | 3096 |
| us-west-2 | 0.197 | 129 |

