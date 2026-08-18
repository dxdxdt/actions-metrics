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
Updated: 2026-08-18T18:25:24.707926+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.189 | 18 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.129 | 5019 |
| us-east-2 | 0.154 | 1680 |
| us-gov-east-1 | 0.159 | 1845 |
| us-gov-west-1 | 0.249 | 224 |
| us-west-1 | 0.192 | 3989 |
| us-west-2 | 0.251 | 182 |

