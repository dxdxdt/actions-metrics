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
Updated: 2026-02-24T15:50:17.016602+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.840 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.588 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.765 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.073 | 4178 |
| us-east-2 | 0.072 | 1375 |
| us-gov-east-1 | 0.080 | 1504 |
| us-gov-west-1 | 0.271 | 161 |
| us-west-1 | 0.231 | 3111 |
| us-west-2 | 0.274 | 130 |

