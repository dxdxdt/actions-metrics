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
Updated: 2026-03-02T01:21:14.578988+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.076 |  |
| ap-east-1 | 0.623 |  |
| ap-east-2 | 0.564 |  |
| ap-northeast-1 | 0.442 |  |
| ap-northeast-2 | 0.551 |  |
| ap-northeast-3 | 0.467 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.699 |  |
| ap-southeast-2 | 0.584 |  |
| ap-southeast-3 | 0.753 |  |
| ap-southeast-4 | 0.623 |  |
| ap-southeast-5 | 0.719 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.801 |  |
| ca-central-1 | 0.317 | 16 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.599 |  |
| eu-central-2 | 0.606 |  |
| eu-north-1 | 0.653 |  |
| eu-south-1 | 0.624 |  |
| eu-south-2 | 0.622 |  |
| eu-west-1 | 0.519 |  |
| eu-west-2 | 0.554 |  |
| eu-west-3 | 0.568 |  |
| il-central-1 | 0.780 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.914 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.707 |  |
| us-east-1 | 0.262 | 4207 |
| us-east-2 | 0.230 | 1387 |
| us-gov-east-1 | 0.231 | 1519 |
| us-gov-west-1 | 0.116 | 167 |
| us-west-1 | 0.058 | 3155 |
| us-west-2 | 0.123 | 136 |

