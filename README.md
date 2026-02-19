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
Updated: 2026-02-19T21:25:37.498383+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.759 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.789 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.123 | 4147 |
| us-east-2 | 0.138 | 1356 |
| us-gov-east-1 | 0.152 | 1492 |
| us-gov-west-1 | 0.254 | 156 |
| us-west-1 | 0.197 | 3084 |
| us-west-2 | 0.249 | 128 |

