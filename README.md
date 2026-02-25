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
Updated: 2026-02-25T17:01:09.598797+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.814 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.630 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.935 |  |
| ap-southeast-4 | 0.839 |  |
| ap-southeast-5 | 0.908 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.422 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.762 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.501 |  |
| us-east-1 | 0.060 | 4183 |
| us-east-2 | 0.097 | 1379 |
| us-gov-east-1 | 0.093 | 1509 |
| us-gov-west-1 | 0.320 | 161 |
| us-west-1 | 0.272 | 3117 |
| us-west-2 | 0.316 | 131 |

