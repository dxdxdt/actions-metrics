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
Updated: 2026-05-02T10:48:06.761495+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.795 |  |
| ap-southeast-5 | 0.868 |  |
| ap-southeast-6 | 0.863 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.357 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.099 | 4584 |
| us-east-2 | 0.101 | 1556 |
| us-gov-east-1 | 0.109 | 1670 |
| us-gov-west-1 | 0.272 | 194 |
| us-west-1 | 0.218 | 3516 |
| us-west-2 | 0.272 | 157 |

