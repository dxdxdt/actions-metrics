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
Updated: 2026-05-06T05:50:30.093295+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.453 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.476 |  |
| eu-west-1 | 0.362 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.091 | 4603 |
| us-east-2 | 0.072 | 1568 |
| us-gov-east-1 | 0.070 | 1675 |
| us-gov-west-1 | 0.259 | 194 |
| us-west-1 | 0.218 | 3535 |
| us-west-2 | 0.268 | 157 |

