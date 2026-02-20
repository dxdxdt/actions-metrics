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
Updated: 2026-02-20T13:56:13.271152+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.932 |  |
| ap-south-2 | 0.988 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.118 | 4153 |
| us-east-2 | 0.120 | 1357 |
| us-gov-east-1 | 0.116 | 1493 |
| us-gov-west-1 | 0.215 | 159 |
| us-west-1 | 0.205 | 3085 |
| us-west-2 | 0.221 | 129 |

