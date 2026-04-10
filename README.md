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
Updated: 2026-04-10T08:18:20.816076+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.803 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.933 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.892 |  |
| ap-southeast-6 | 0.852 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.300 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.429 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.376 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.771 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.074 | 4471 |
| us-east-2 | 0.093 | 1489 |
| us-gov-east-1 | 0.107 | 1638 |
| us-gov-west-1 | 0.302 | 192 |
| us-west-1 | 0.236 | 3386 |
| us-west-2 | 0.293 | 154 |

