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
Updated: 2026-09-08T16:57:50.301450+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.741 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.143 | 18 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.451 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.095 | 5092 |
| us-east-2 | 0.116 | 1685 |
| us-gov-east-1 | 0.111 | 1903 |
| us-gov-west-1 | 0.264 | 231 |
| us-west-1 | 0.207 | 4090 |
| us-west-2 | 0.262 | 192 |

