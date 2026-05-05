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
Updated: 2026-05-05T22:50:06.319227+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.862 |  |
| ap-east-1 | 0.808 |  |
| ap-east-2 | 0.754 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.739 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.820 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.899 |  |
| ap-southeast-2 | 0.829 |  |
| ap-southeast-3 | 0.958 |  |
| ap-southeast-4 | 0.853 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.852 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.415 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.299 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.353 |  |
| il-central-1 | 0.538 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.481 |  |
| us-east-1 | 0.053 | 4603 |
| us-east-2 | 0.101 | 1567 |
| us-gov-east-1 | 0.102 | 1673 |
| us-gov-west-1 | 0.343 | 194 |
| us-west-1 | 0.295 | 3535 |
| us-west-2 | 0.337 | 157 |

