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
Updated: 2026-02-14T16:20:45.551790+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.705 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.855 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.769 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.077 | 4121 |
| us-east-2 | 0.072 | 1339 |
| us-gov-east-1 | 0.071 | 1466 |
| us-gov-west-1 | 0.260 | 147 |
| us-west-1 | 0.258 | 3059 |
| us-west-2 | 0.259 | 125 |

