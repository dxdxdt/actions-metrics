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
Updated: 2026-09-24T22:52:55.379339+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.823 |  |
| ap-east-2 | 0.748 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.819 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.930 |  |
| ap-southeast-2 | 0.782 |  |
| ap-southeast-3 | 0.970 |  |
| ap-southeast-4 | 0.831 |  |
| ap-southeast-5 | 0.935 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 1.014 |  |
| ca-central-1 | 0.090 | 18 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.396 |  |
| eu-north-1 | 0.439 |  |
| eu-south-1 | 0.412 |  |
| eu-south-2 | 0.421 |  |
| eu-west-1 | 0.298 |  |
| eu-west-2 | 0.337 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.044 | 5120 |
| us-east-2 | 0.076 | 1686 |
| us-gov-east-1 | 0.080 | 1926 |
| us-gov-west-1 | 0.307 | 235 |
| us-west-1 | 0.259 | 4136 |
| us-west-2 | 0.309 | 192 |

