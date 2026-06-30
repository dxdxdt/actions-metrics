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
Updated: 2026-06-30T13:05:54.019880+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.616 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.089 | 4804 |
| us-east-2 | 0.079 | 1648 |
| us-gov-east-1 | 0.085 | 1725 |
| us-gov-west-1 | 0.262 | 199 |
| us-west-1 | 0.206 | 3723 |
| us-west-2 | 0.258 | 163 |

