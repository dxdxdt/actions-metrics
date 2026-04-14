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
Updated: 2026-04-14T01:52:13.183968+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.870 |  |
| ap-east-1 | 0.809 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.842 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.888 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.831 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.990 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.380 |  |
| eu-central-2 | 0.396 |  |
| eu-north-1 | 0.446 |  |
| eu-south-1 | 0.407 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.342 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.553 |  |
| me-central-1 | 0.759 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.482 |  |
| us-east-1 | 0.056 | 4497 |
| us-east-2 | 0.091 | 1499 |
| us-gov-east-1 | 0.101 | 1646 |
| us-gov-west-1 | 0.311 | 193 |
| us-west-1 | 0.268 | 3409 |
| us-west-2 | 0.307 | 155 |

