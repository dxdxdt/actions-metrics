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
Updated: 2026-08-02T14:55:36.966596+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.063 |  |
| ap-east-1 | 0.629 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.452 |  |
| ap-northeast-2 | 0.560 |  |
| ap-northeast-3 | 0.478 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.868 |  |
| ap-southeast-1 | 0.704 |  |
| ap-southeast-2 | 0.583 |  |
| ap-southeast-3 | 0.762 |  |
| ap-southeast-4 | 0.623 |  |
| ap-southeast-5 | 0.724 |  |
| ap-southeast-6 | 0.625 |  |
| ap-southeast-7 | 0.811 |  |
| ca-central-1 | 0.320 | 17 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.597 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.607 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.500 |  |
| eu-west-2 | 0.542 |  |
| eu-west-3 | 0.556 |  |
| il-central-1 | 0.743 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.697 |  |
| us-east-1 | 0.257 | 4932 |
| us-east-2 | 0.261 | 1673 |
| us-gov-east-1 | 0.266 | 1796 |
| us-gov-west-1 | 0.110 | 209 |
| us-west-1 | 0.053 | 3872 |
| us-west-2 | 0.108 | 172 |

