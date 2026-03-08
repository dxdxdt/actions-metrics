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
Updated: 2026-03-08T04:04:56.389003+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.731 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.661 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.831 |  |
| ca-central-1 | 0.251 | 16 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.568 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.594 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.578 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.517 |  |
| eu-west-3 | 0.533 |  |
| il-central-1 | 0.724 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.892 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.650 |  |
| us-east-1 | 0.221 | 4237 |
| us-east-2 | 0.192 | 1408 |
| us-gov-east-1 | 0.205 | 1542 |
| us-gov-west-1 | 0.144 | 174 |
| us-west-1 | 0.102 | 3193 |
| us-west-2 | 0.149 | 143 |

