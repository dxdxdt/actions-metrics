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
Updated: 2026-08-23T18:18:03.925819+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.591 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.576 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.638 |  |
| ap-southeast-3 | 0.785 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.753 |  |
| ap-southeast-6 | 0.662 |  |
| ap-southeast-7 | 0.832 |  |
| ca-central-1 | 0.261 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.583 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.203 | 5050 |
| us-east-2 | 0.213 | 1681 |
| us-gov-east-1 | 0.188 | 1872 |
| us-gov-west-1 | 0.154 | 226 |
| us-west-1 | 0.107 | 4040 |
| us-west-2 | 0.152 | 184 |

